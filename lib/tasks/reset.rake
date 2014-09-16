desc 'Resets the application to a clean slate'
task :reset do
  %w( db:reset user mock ).each do |task|
    Rake::Task[task].invoke
  end
end
