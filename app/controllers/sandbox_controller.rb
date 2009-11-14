class SandboxController < ApplicationController
  include Apotomo::ControllerMethods
  
  def drink
    
    use_widgets do |root|
      root << drink = section('drink')
        drink << cell(:michal,   :sober,       'drinker')
        drink << cell(:beer,     :display,     'yummy')
      
        drink.respond_to_event(:beerDropped, :with => :drinking, :on => 'drinker')
    end
    
    render :text => render_widget('drink'), :layout => 'rails'
  end
  
end
