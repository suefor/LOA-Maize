module LanguageHelper
  def change_language_link
    if I18n.locale == 'en' 
      link_to 'Español', "#{APP_CONFIG[:spanish_website_url]}#{request.env['REQUEST_URI']}", :style => 'float:right; margin-right: 5px'
    else
      link_to 'English', "#{APP_CONFIG[:english_website_url]}#{request.env['REQUEST_URI']}", :style => 'float:right; margin-right: 5px'
    end
  end
end