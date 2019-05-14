module PostsHelper
  def formatted_datetime(datetime)
    datetime.getlocal.strftime('%d.%m.%Y - %H:%M')
  end
end
