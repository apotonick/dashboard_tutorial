class TodoCell < Apotomo::StatefulWidget
  
  # :list is a "loop state" and will not walk to another state per default.
  transition :in => :list
  transition :from => :new, :to => :create
  transition :in => :create
  transition :from => :trashbin, :to => :delete
  
  
  # listing things --------------------------------------------
  def list_init
    @list = Todo.find(:all)[-2,2] # initialize.
    jump_to_state :list
  end
  
  def list
    nil
  end
  
  
  # new item --------------------------------------------------
  def new
    @todo = Todo.new
    nil
  end
  
  def create
    return render :view => :new unless @todo.update_attributes(param(:todo))
    
    # valid:
    #@todo.save
    trigger(:newItem)         # inform others.
    jump_to_state :new        # go back to :new state.
  end
  
  
  # todo statistics -------------------------------------------
  def today
    @count = Todo.find(:all).size
    nil
  end
  
  
  # delete item -----------------------------------------------
  def trashbin
    nil
  end
  
  def delete
    Todo.delete(param(:id).sub("el", ""))
    trigger :newItem
    jump_to_state :trashbin
  end
  
end
