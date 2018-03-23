# Input your code here
require 'csv'
require 'byebug'

if ARGV.size == 0
  puts "por favor passe os parametros exemplo --source data/users.csv"
else
  params = Hash[*ARGV]
  file_path = params["--source"]

  if params["--total"] == "TotalValue"
    total = 0
    CSV.foreach(file_path, 'r') do |row|
      total += row[3].to_i
    end
    puts "TotalValue: #{total}"
  else
    #Listar os usuários
    lista = []
    CSV.foreach(file_path, 'r') do |row|
      lista << row
    end

    if params["--order_by"] == "age asc"
      lista = lista.sort{|x,y| x[1]<=>y[1]}
    elsif params["--order_by"] == "age desc"
      lista = lista.sort{|x,y| y[1]<=>x[1]}
    elsif params["--order_by"] == "name asc"
      lista = lista.sort{|x,y| x[0]<=>y[0]}
    elsif params["--order_by"] == "name desc"
      lista = lista.sort{|x,y| y[0]<=>x[0]}
    end

    if not params["--find"].nil?
      lista = lista.select{|l| l[0].strip.downcase.include? params["--find"].strip.downcase }
    end

    lista.each do |row|
      puts "#{row[0]} | #{row[1]} | #{row[2]} | #{row[3]}"
    end
  end
end


