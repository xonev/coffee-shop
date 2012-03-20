def jessie
  system('jessie spec/app -f nested') 
  puts "====================="
end

watch('spec/app.*\.coffee') { jessie() }
watch('app/.*\.coffee') { jessie() }


