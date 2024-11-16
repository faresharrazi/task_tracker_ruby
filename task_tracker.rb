require 'json'

TASKS_FILE = 'tasks.json'

def initialize_file
  unless File.exist?(TASKS_FILE)
    File.write(TASKS_FILE, '[]') # Initialize with an empty array
  end
end

def load_tasks
  JSON.parse(File.read(TASKS_FILE))
end

def save_tasks(tasks)
  File.write(TASKS_FILE, JSON.pretty_generate(tasks))
end

initialize_file

# puts "Welcome to Task Tracker!"



# puts "Command: #{command}"
# puts "Arguments: #{args.join(' ')}"

def add_task (description)
  tasks = load_tasks

  new_id = tasks.empty? ? 1 : tasks.last['id'] +1

  new_task = {
    id: new_id,
    description: description,
    status: 'todo',
    createdAt: Time.now.to_s,
    updatedAt: Time.now.to_s
  }

  tasks << new_task
  save_tasks (tasks)
  puts "Task added successfully (ID: #{new_id})"

end

command = ARGV[0] 
args = ARGV[1..] 

case command
when 'add'
  add_task(args.join(' '))
else 
  puts 'Unknown command!'
end
