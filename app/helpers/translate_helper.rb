module TranslateHelper

  def tc(key, options = {})
    I18n.t("controller.#{controller.controller_name}.#{key}", options)
  end

  def tg(key, category=nil, options = {})
    category = "misc" unless category
    translate("global.#{category}.#{key}", options)
  end

  def tgm(key, options = {})
    ActionController::Base.helpers.sanitize tg(key, :misc, options)
  end

  def tgn(key, options = {})
    ActionController::Base.helpers.sanitize tg(key, :notice, options)
  end

  def tf(model, key, options = {})
    t("activerecord.attributes.#{model.name.underscore}.#{key}", options)
  end

end
