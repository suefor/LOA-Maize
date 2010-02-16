module LanguageHelper
  def change_language_link
    if I18n.locale == 'es'
      link_to 'English', url_for(params.merge(:subdomain => 'en')), :style => 'float:right; margin-right: 5px'
    else
      link_to 'Español', url_for(params.merge(:subdomain => 'es')), :style => 'float:right; margin-right: 5px'
    end
  end
end