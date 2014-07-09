class Picture < Asset
  mount_uploader :data, PictureUploader

  validates_integrity_of :data
  validates_filesize_of :data, :maximum => 2.megabytes.to_i

  # structure of returned json array of files. (used in Hash.to_json operation)
  def serializable_hash(options=nil)
    {
        "id" => id.to_s,
        "filename" => File.basename(data.path),
        "url" => data.url,
        "thumb_url" => data.url(:thumb),
        "public_token" => public_token
    }
  end
end
  
