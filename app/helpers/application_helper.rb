# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def javascripts_frameworks
    returning "" do |html|
      html << javascript_include_tag('http://ajax.googleapis.com/ajax/libs/prototype/1.6.1.0/prototype')
      html << javascript_include_tag('http://ajax.googleapis.com/ajax/libs/scriptaculous/1.8.2/scriptaculous.js?load=effects,controls')
    end
  end

  def form_field(f, type, name, label)
    "<li>
      <label for='#{name}'>#{label}</label>
      #{f.send(type, name)}
    </li>"
  end
end
