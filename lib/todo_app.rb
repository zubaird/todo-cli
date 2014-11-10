class TodoApp < CommandLineApp
  def initialize(input, output)
    @input = input
    @output = output
  end

  def real_puts message=""
    $stdout.puts message
  end

  def run


    puts "Welcome"
    puts "'list' to list projects'"
    puts "'create' to create a new project"
    puts "'edit' to edit a project"
    input = gets.chomp

    while input == "list" do
        puts "Projects:"
        if !@create_this.nil?
          puts "  #{@create_this}"
        else
          puts "  none"
        end
        input = gets.chomp
    end

    while input == "create" do
        input = gets.chomp
        @create_this = input
        puts "Projects:"
        puts "  #{@create_this}"
    end

    while input != "quit" do
      input = gets.chomp
    end

  end

end
