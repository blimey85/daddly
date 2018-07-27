Trestle.admin(:dashboard) do
  menu do
    item :dashboard, icon: 'fas fa-home'
  end

  controller do
    def index
      @user_count = User.all.count
      @event_count = Event.all.count
    end
  end
end
