class Lead
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :access_token, :pGUID, :pAccName, :pPartner,
                :name, :email, :business_name, :telephone_number, :contact_time,
                :notes, :reference

  VALID_FULLNAME_REGEX = /\A\w+\s{1}\w+\z/
  VALID_DATETIME_REGEX = /\A[\d]{4}-[0-1][0-2]-[0-3][0-9](\s{1}|T)[0-2][0-9]:[0-5][0-9](:[0-9][0-9])?\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :name, presence: { message: I18n.t('lead_api_errors.name_is_required') }
  validates :business_name, presence: { message: I18n.t('lead_api_errors.business_is_required') }
  validates :telephone_number, presence: { message: I18n.t('lead_api_errors.phone_number_required') }
  validates :telephone_number, length: { in: 11..13, wrong_length: I18n.t('lead_api_errors.phone_number_11_numbers') }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, message: I18n.t('lead_api_errors.email_wrong_format') }
  validates :name, format: { with: VALID_FULLNAME_REGEX, message: I18n.t('lead_api_errors.firstname_space_lastname') }
  validates :contact_time, format: { with: VALID_DATETIME_REGEX, message: I18n.t('lead_api_errors.contact_time_wrong') }
  validates :business_name, length: { maximum: 100, too_long: I18n.t('lead_api_errors.business_100_chars') }
  validates :reference, length: { maximum: 50, too_long: I18n.t('lead_api_errors.reference_less_50_chars') }
  validates :notes, length: { maximum: 255, too_long: I18n.t('lead_api_errors.notes_max_255_chars') }
end
