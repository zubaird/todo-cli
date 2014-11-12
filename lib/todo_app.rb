require_relative "./Project"

class TodoApp < CommandLineApp

  def initialize(input, output)
    @input = input
    @output = output
    @project_list = {}

  end

  def welcome_menu
    puts "Welcome"
    puts "'list' to list projects"
    puts "'create' to create a new project"
    puts "'edit' to edit a project"
    puts "'rename' to rename a project"
  end

  def task_menu
    puts "'list' to list tasks"
    puts "'create' to create a new task"
    puts "'edit' to edit a task"
    puts "'complete' to complete a task and remove it from the list"
  end

  def real_puts message=""
    $stdout.puts message
  end

  def quit
    true
  end

  def create
      # => Create a new Project instance
    project = Project.new

    puts "Please enter the new project name:"
    project.name = gets.chomp

      # => Add instance to a hash
    @project_list["#{project.name}"] = project

    # puts "Projects:\n  #{project.name}"
  end

  def rename
      # => Get name of project to be changed
    puts "Please enter the project name to rename:"
    old_name = gets.chomp
      # => Get new project name to set
    puts "Please enter the new project name:"
    new_name = gets.chomp

      # => Set the new name using hash[key - old_name]
    @project_list[old_name].name = new_name
    puts "Projects:\n  #{@project_list[old_name].name}"
    # p "Projects:\n  #{@project_list[old_name]}"
  end

  def edit
      # => Get name of project to be edited
    puts "Please enter the project name to edit:"
    @project_to_edit = gets.chomp
    puts "Editing Project: #{@project_list[@project_to_edit].name}"

    begin
      task_menu
      option = gets.chomp

      if option == "list"
        if @project_list[@project_to_edit].tasks == []
          puts "  none"
        else
          puts @project_list[@project_to_edit].tasks.join(" ")
        end
      end

      if option == "create"
        puts "Enter task name"
        task_name = gets.chomp
        @project_list[@project_to_edit].tasks << task_name
      end

      if option == "edit"
        puts "Enter task name to edit"
        edit_task_name = gets.chomp
        edit_task_index = @project_list[@project_to_edit].tasks.index(edit_task_name).to_i

          if @project_list[@project_to_edit].tasks.index(edit_task_name).nil?
            puts "task not found: '#{edit_task_name}'"
          else
            puts "Enter new task name"
            new_task_name = gets.chomp
             @project_list[@project_to_edit].tasks[edit_task_index] = new_task_name
          end
      end

      if option == "complete"
        puts "Enter task that was completed"
        completed_task_name = gets.chomp
        completed_task_index = @project_list[@project_to_edit].tasks.index(completed_task_name).to_i
        completed_task = @project_list[@project_to_edit].tasks[completed_task_index]

          if @project_list[@project_to_edit].tasks.index(completed_task_name).nil?
            puts "task not found: '#{completed_task_name}'"
          else
            puts "Enter completed task name"
            completed_task.completed = true
            puts "#{completed_task}: completed"
          end
      end
    end until option == "back"
  end

  # def project_task(task_name)
  #   new_task_index = @project_list[@project_to_edit].tasks.index(task_name)
  #   @project_list[@project_to_edit].tasks[new_task_index]
  # end

  def delete
      # => Get name of project to be changed
    puts "Please enter the project name to delete:"
    delete_project = gets.chomp
      # => Delete the new name using hash[key - old_name]
    @project_list.delete(delete_project)
    puts "Projects:\n  none"
  end

  def list_projects
    puts "Projects:"
    if @project_list == {}
      puts "  none"
    else
      puts "  #{@project_list.keys.join}"
    end
  end

  def run
    begin
      welcome_menu

      input = gets.chomp

      if input == "list"
        list_projects
      end

      if input == "create"
        create
      end

      if input == "rename"
        rename
      end

      if input == "edit"
        edit
      end

      if input == "delete"
        delete
      end

    end until input == "quit"
  end
end

# => BAM!
class String
  def completed=(value=false)
    value
  end
end
