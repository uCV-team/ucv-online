module LanguagesHelper
  def cefr_level(level)
    cefr_level_options[level.to_sym]
  end

  def cefr_level_options
    levels = Language::CEFR_LEVELS
    human_levels = levels.map { |level| I18n.t(level, scope: 'cefr_levels') }
    levels.zip(human_levels).to_h.symbolize_keys
  end

  def language_options(lang, usr)
    if cv_show_page?
      "http://#{lang}.#{ENV['SERVER_HOST']}/cv/#{usr.subdomain}"
    else
      "http://#{lang}.#{ENV['SERVER_HOST']}"
    end
  end
end
