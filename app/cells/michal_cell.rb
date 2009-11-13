class MichalCell < Apotomo::StatefulWidget

  transition :from => :sober, :to => :drinking
  transition :in => :drinking
  
  def display
    jump_to_state :sober
  end
  
  def sober
    @beers = 0
    render
  end
  
  
  def drinking
    @beers += 1
    render
  end
end
