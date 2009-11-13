class TimeCell < Apotomo::StatefulWidget
  transition :from => :display, :to => :shout
  transition :in => :shout

  def display
    respond_to_event :clockClicked, :with => :shout
    
    render
  end
  
  def shout
    render :js => "alert('The current server time is #{Time.now}')"
  end
end
