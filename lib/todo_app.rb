require_relative "Project.rb"
class TodoApp < CommandLineApp

  def initialize(input, output)
    @input = input
    @output = output
    @project_list = {}
  end

  def real_puts message=""
    $stdout.puts message
  end

  def quit
    true
  end

  def create
      # => Create a new Project instance
    @project = Project.new
    puts "Please enter the new project name:"
    @project.name = gets.chomp
      # => Add instance to a hash
    @project_list["#{@project.name}"] = @project
    puts "Projects:\n  #{@project.name}"
  end

  def rename
      # => Get name of project to be changed
    puts "Please enter the project name to rename:"
    old_name = gets.chomp
      # => Get new project name to set
    puts "Please enter the new project name:"
    new_name = gets.chomp
      # => Set the new name using hash[key - old_name]
    @project_list[old_name] = new_name
    puts "Projects:\n  #{@project_list[old_name]}"
  end

  def edit
      # => Get name of project to be edited
    puts "Please enter the project name to edit:"
    project_to_edit = gets.chomp
    puts "Editing Project: #{@project_list[project_to_edit].name}"
    option = gets.chomp
    if option == "back"
      # => welcome menu
    end

      # => add back option
  end
  

  def delete
      # => Get name of project to be changed
    puts "Please enter the project name to delete:"
    delete_project = gets.chomp
      # => Delete the new name using hash[key - old_name]
    @project_list.delete(delete_project)
    puts "Projects:\n  none"
  end

  def list
    puts "Projects:"
    if @project_list.empty?
      puts "  none"
    else
      @project_list
      # => add list of tasks for speciifc project
    end
  end

  def run
    begin
      puts "Welcome"
      puts "'list' to list projects'"
      puts "'create' to create a new project"
      puts "'edit' to edit a project"
      input = gets.chomp

      if input == "list"
        list
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
