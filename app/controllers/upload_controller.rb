require 'open-uri'
require 'json'

class UploadController < ApplicationController

  def index
  end

  def submit
    if(!facebook_user)
      flash[:notice] = 'Please login to facebook to post images'
      redirect_to upload_url and return
    end

    file = params[:image_upload]
    
    if file.content_type == 'image/jpeg' or file.content_type == 'image/png'
      post = Post.create({
        mime_type: file.content_type, 
        size: file.size, 
        uploaded_by: params[:fb_uid], 
        uploaded_by_name: facebook_user['name'],
        image_title: params[:image_title],
        file_name: Post.random_filename(File.extname(file.original_filename)), 
      })

      post.save_images file

      x = open("https://graph.facebook.com/#{params[:fb_uid]}/wermlandforever:upload?photo=#{fullsize_url({:unique_id => post.unique_id})}&access_token=#{params[:fb_access_token]}")
      abort x.read.to_s
    end

    redirect_to upload_url and return
  end
end
