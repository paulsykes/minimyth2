
MYTHTV_GARVERSION_SHORT = master
MYTHTV_SVN_VERSION      = 20221231-g7ee3a2909f
MYTHTV_GIT_VERSION      = v33-Pre-1039-g7ee3a2909f
MYTHTV_GIT_HASH         = 7ee3a2909f82237e7bc99531b8049ee953776f9f

MYTHTV_VERSION = $(MYTHTV_GARVERSION_SHORT)-$(MYTHTV_SVN_VERSION)

MYTHTV_SOURCEDIR = $(sourcedir)/mythtv

MYTHTV_CONFIGURE_ENV = \
	PYTHONXCPREFIX=$(DESTDIR)$(prefix)
MYTHTV_BUILD_ENV     =
MYTHTV_INSTALL_ENV   = \
	INSTALL_ROOT="/" \

MYTHTV_PLUGINS_CONFIGURE_ARGS = \
	--prefix="$(DESTDIR)$(prefix)" \
	--sysroot="$(DESTDIR)$(rootdir)" \
	--qmake="$(qtqmake)" \
	--libdir-name="$(patsubst $(prefix)/%,%,$(libdir))" \
	--disable-all \
	--enable-opengl \
	--enable-cross-compile \

post-install-mythtv-version:
	@install -d $(DESTDIR)$(versiondir) 
	@echo "branch $(MYTHTV_GARVERSION_SHORT) through GIT $(MYTHTV_SVN_VERSION)" > $(DESTDIR)$(versiondir)/$(GARNAME)
	@$(MAKECOOKIE)
