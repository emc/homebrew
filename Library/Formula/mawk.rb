require 'formula'

class Mawk <Formula
  @url='http://invisible-island.net/datafiles/release/mawk.tar.gz'
  @homepage='http://invisible-island.net/mawk/mawk.html'
  @md5='0df02f5a07cdb065a13e56c5abcd008a'
  @version='1.3.3'

  def patches
    DATA
  end

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking", "--with-readline=/usr/lib"
    system "make install"
  end
end


__END__
diff -r 3358498a60ea Makefile.in
--- a/Makefile.in	Mon Sep 14 19:17:51 2009 +0200
+++ b/Makefile.in	Mon Sep 14 19:18:19 2009 +0200
@@ -118,7 +118,7 @@
 
 $(BINDIR) \
 $(MANDIR) :
-	sh -c "mkdirs.sh $@"
+	sh -c "./mkdirs.sh $@"
 
 # output from  mawk -f deps.awk *.c
 array.o : config.h field.h bi_vars.h mawk.h symtype.h nstd.h memory.h array.h zmalloc.h types.h sizes.h
