class Attachment < ActiveRecord::Base
	belongs_to :article

	has_attached_file :image
	# styles: { medium: "500x500>", thumb: "100x100>" } -- This doesn't work
	# using paperclip 3.5.4
	# instead I changed it to inline HTML styles

	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
