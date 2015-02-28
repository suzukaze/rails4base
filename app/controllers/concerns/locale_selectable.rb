module LocaleSelectable
  extend ActiveSupport::Concern

  included do
    before_action :set_locale_from_params
  end

  private
  def set_locale_from_params
    I18n.locale = params[:locale].presence || session[:locale].presence || I18n.default_locale
    session[:locale] = I18n.locale
  end
end
