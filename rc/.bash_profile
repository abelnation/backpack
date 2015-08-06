
# backpack bin
export PATH="~/.bash/bin:${PATH}"

# /usr/local/bin
export PATH="/usr/local/bin:${PATH}"

echo "Loading configs"
for f in ~/.bash/config/*.rc; do
	echo "Reading $f..."
	source $f
done

echo "Loading aliases"
for f in ~/.bash/aliases/*.alias; do
	echo "Reading $f..."
	source $f
done
