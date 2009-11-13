class DesktopController < ApplicationController
  layout 'desktop'
  
  include Apotomo::ControllerMethods
  
  def index
    
    use_widgets do |root|
      
      # statically define list of widgets to display:
      
      root << cell(:weather,  :display,     'weather_forecast')
      root << cell(:michal,   :sober,       'drinker')
      
        # a section is just a container widget to group things together:
      root << todo = section('todo')
        todo << cell(:todo,   :list_init,   'todo_list')
        todo << cell(:todo,   :new,         'todo_form')
        
      root << cell(:beer,     :display,     'yummy')
      root << cell(:todo,     :today,       'todo_counter')
      
      # for demonstration purpose, event handlers are defined here, not in the widget itself:
      
        # let michal drink:
      root.find_by_id('drinker').respond_to_event(:beerDropped, :with => :drinking)
        
        # update the todo widgets in case of a new todo item:
      root.respond_to_event(:newItem, :on => 'todo_counter', :with =>:today)
      root.respond_to_event(:newItem, :on => 'todo_list',    :with => :list_init)
    end
    
    
    # statically render each widget to its slot:
    @slot_0 = render_widget('weather_forecast')
    @slot_1 = render_widget('drinker')
    @slot_2 = render_widget('todo')
    @slot_3 = render_widget('todo_counter')
    @slot_5 = render_widget('yummy')
    
    render
  end
end
