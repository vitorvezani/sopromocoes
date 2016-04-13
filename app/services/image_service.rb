class ImageService

  def initialize(args)
    @delegate = delegate_object
  end

  def self.save(item)
    Cloudinary::Uploader.upload(item.image_url,
                            public_id: item.class.to_s.downcase + "_" + item.id.to_s ,
                            crop: :limit, width: 150, height: 150
                            # eager: [
                            #   { width: 100, height: 100,
                            #     crop: :thumb, gravity: :face,
                            #     radius: 20, effect: :sepia }
                            # ],
                            #tags: ['promotion']
                            )['url']
  end

end
