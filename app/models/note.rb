class Note < ApplicationRecord
  belongs_to :teaching

  validates :attachment, presence: true
  validates :teaching, presence: true

  mount_uploader :attachment, AttachmentUploader
end
