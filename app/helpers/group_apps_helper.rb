module GroupAppsHelper
  def get_icon(group_app=nil)
    icon 'far', 'file'
    unless group_app.fa_icon.nil? || group_app.fa_icon == ''
      icon = group_app.fa_icon.split(' ')
      if icon.length == 2
        icon icon[0], icon[1]
      end
    end
  end
end
