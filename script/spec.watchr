def jessie
  system('jessie spec -f nested') 
  puts "====================="
end

watch('spec/.*\.coffee') { jessie() }
watch('app/.*\.coffee') { jessie() }


