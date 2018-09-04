module GroupAppsHelper
  def get_icon(group_app=false)
    if group_app
      icon = group_app.fa_icon.split(' ')
      icon icon[0], icon[1]
    else
      icon 'far', 'fa-file'
    end
  end
end
