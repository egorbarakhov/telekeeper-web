class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  before_create :assign_uuid_v7

  private

  # Assigns a UUID v7 to the record's id
  #
  # @note https://www.ietf.org/rfc/rfc4122.txt
  # @see https://github.com/uuidjs/uuid#uuidv7options-buffer-offset
  def assign_uuid_v7
    self.id ||= SecureRandom.uuid_v7.to_s
  end
end
