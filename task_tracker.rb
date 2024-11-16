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

puts "Welcome to Task Tracker!"

def update_status (task_id, status)
  tasks = load_tasks
  task = tasks.find { |t| t['id'] == task_id.to_i }
  if task 
    task['status'] = status
    task['updatedAt'] = Time.now.to_s
    save_tasks(tasks)
    puts "Task ##{task_id} marked as #{status}"
  else
    puts "Task not found!"
  end
end

def list_tasks (filter)
  tasks = load_tasks
  tasks = tasks.select {|task| task['status'] == filter} if filter
  if tasks.empty?
    puts "No tasks found"
  else
    tasks.each do |task|
      puts "id: #{task['id']} - #{task['description']} - status: #{task['status']}"
    end 
  end
end

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
when 'list'
  list_tasks(args[0])
when 'add'
  add_task(args.join(' '))
when 'mark-done'
  update_status(args[0], 'done')
when 'mark-in-progress'
  update_status(args[0], 'in-progress')
else 
  puts 'Unknown command!'
end
