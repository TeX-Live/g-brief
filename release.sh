PROJECT=g-brief
VER=$1
if [ -z "$VER" ] ; then
	echo "Need version as first argument" >&2
	exit 1
fi
if [ -r "$PROJECT-$VER.zip" ] ; then
	echo "File $PROJECT-$VER.zip already present, aborting" >&2
	exit 1
fi
echo "Making Release $VER. Ctrl-C to cancel."
read REPLY
echo
git commit -m "Release $VER" --allow-empty
git tag v$VER
git archive --format=zip --prefix=$PROJECT-$VER/ HEAD > $PROJECT-$VER.zip
