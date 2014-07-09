class Asset < ActiveRecord::Base
  include Uploader::Asset

  #belongs_to :assetable, :polymorphic => true, :index => true

  def uploader_create(params, request = nil)
    ability = Ability.new(request.env['warden'].user)

    if ability.can? :create, self
      self.user = request.env['warden'].user
      super
    else
      errors.add(:id, :access_denied)
    end
  end

  def uploader_destroy(params, request = nil)
    ability = Ability.new(request.env['warden'].user)

    if ability.can? :delete, self
      super
    else
      errors.add(:id, :access_denied)
    end
  end
end


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


