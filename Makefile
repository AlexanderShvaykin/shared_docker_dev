install:
	@which dip &> /dev/null || gem install dip
	# ln -sf dip.yml ~/dip.yml
	cp dip.yml ~/dip.yml
