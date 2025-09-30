def main
  while true
    display_menu
    num = get_process_selection
    execute_process(num)
  end
end

def display_menu
  puts "Please select the process you wish to perform"
  puts "1: Enter evaluation points and comments"
  puts "2: Check the results so far"
  puts "3: Stop"
end

def get_process_selection
  loop do
    num = gets.to_i
    if num >= 1 && num <= 3
      return num
    else
      puts "Please enter 1 to 3"
    end
  end
end

def execute_process(num)
  case num
  when 1
    enter_evaluation
  when 2
    check_results
  when 3
    terminate_process
  end
end

def enter_evaluation
  puts "Please enter a rating on a scale of 1 to 5"
  point = get_evaluation_points
  
  puts "Enter your comments"
  comment = gets.chomp
  
  post = "point：#{point}　comment：#{comment}"
  
  File.open("data.txt", "a") do |file|
    file.puts(post)
  end
  
  puts "Evaluation saved successfully!"
end

def get_evaluation_points
  loop do
    point = gets.to_i
    if point >= 1 && point <= 5
      return point
    else
      puts "Please enter on a scale of 1 to 5"
    end
  end
end

def check_results
  puts "Results to date"
  
  if File.exist?("data.txt")
    File.open("data.txt", "r") do |file|
      file.each_line do |line|
        puts line
      end
    end
  else
    puts "No evaluations found yet."
  end
end

def terminate_process
  puts "Termination."
  exit
end

# Start the program
main