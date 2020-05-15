# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := agorasdk
DEFS_Debug := \
	'-DNODE_GYP_MODULE_NAME=agorasdk' \
	'-DUSING_UV_SHARED=1' \
	'-DUSING_V8_SHARED=1' \
	'-DV8_DEPRECATION_WARNINGS=1' \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DOPENSSL_NO_PINSHARED' \
	'-DBUILDING_NODE_EXTENSION' \
	'-DDEBUG' \
	'-D_DEBUG' \
	'-DV8_ENABLE_CHECKS'

# Flags passed to all source files.
CFLAGS_Debug := \
	-fPIC \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-g \
	-O0

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++1y

INCS_Debug := \
	-I/home/andy/.cache/node-gyp/10.18.1/include/node \
	-I/home/andy/.cache/node-gyp/10.18.1/src \
	-I/home/andy/.cache/node-gyp/10.18.1/deps/openssl/config \
	-I/home/andy/.cache/node-gyp/10.18.1/deps/openssl/openssl/include \
	-I/home/andy/.cache/node-gyp/10.18.1/deps/uv/include \
	-I/home/andy/.cache/node-gyp/10.18.1/deps/zlib \
	-I/home/andy/.cache/node-gyp/10.18.1/deps/v8/include \
	-I$(srcdir)/sdk/include \
	-I$(srcdir)/sdk/include/base

DEFS_Release := \
	'-DNODE_GYP_MODULE_NAME=agorasdk' \
	'-DUSING_UV_SHARED=1' \
	'-DUSING_V8_SHARED=1' \
	'-DV8_DEPRECATION_WARNINGS=1' \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DOPENSSL_NO_PINSHARED' \
	'-DBUILDING_NODE_EXTENSION'

# Flags passed to all source files.
CFLAGS_Release := \
	-fPIC \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-O3 \
	-fno-omit-frame-pointer

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++1y

INCS_Release := \
	-I/home/andy/.cache/node-gyp/10.18.1/include/node \
	-I/home/andy/.cache/node-gyp/10.18.1/src \
	-I/home/andy/.cache/node-gyp/10.18.1/deps/openssl/config \
	-I/home/andy/.cache/node-gyp/10.18.1/deps/openssl/openssl/include \
	-I/home/andy/.cache/node-gyp/10.18.1/deps/uv/include \
	-I/home/andy/.cache/node-gyp/10.18.1/deps/zlib \
	-I/home/andy/.cache/node-gyp/10.18.1/deps/v8/include \
	-I$(srcdir)/sdk/include \
	-I$(srcdir)/sdk/include/base

OBJS := \
	$(obj).target/$(TARGET)/agora_node_ext/AgoraSdk.o \
	$(obj).target/$(TARGET)/agora_node_ext/agora_node_recording.o \
	$(obj).target/$(TARGET)/agora_node_ext/node_async_queue.o \
	$(obj).target/$(TARGET)/agora_node_ext/node_log.o \
	$(obj).target/$(TARGET)/agora_node_ext/node_napi_api.o \
	$(obj).target/$(TARGET)/agora_node_ext/node_uid.o \
	$(obj).target/$(TARGET)/agora_node_ext/agora_node_ext.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-pthread \
	-rdynamic \
	-m64 \
	-L./sdk/libs/

LDFLAGS_Release := \
	-pthread \
	-rdynamic \
	-m64 \
	-L./sdk/libs/

LIBS := \
	/home/andy/devel/flamingo-record/record/src/sdk/libs/librecorder.a

$(obj).target/agorasdk.node: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/agorasdk.node: LIBS := $(LIBS)
$(obj).target/agorasdk.node: TOOLSET := $(TOOLSET)
$(obj).target/agorasdk.node: $(OBJS) FORCE_DO_CMD
	$(call do_cmd,solink_module)

all_deps += $(obj).target/agorasdk.node
# Add target alias
.PHONY: agorasdk
agorasdk: $(builddir)/agorasdk.node

# Copy this to the executable output path.
$(builddir)/agorasdk.node: TOOLSET := $(TOOLSET)
$(builddir)/agorasdk.node: $(obj).target/agorasdk.node FORCE_DO_CMD
	$(call do_cmd,copy)

all_deps += $(builddir)/agorasdk.node
# Short alias for building this executable.
.PHONY: agorasdk.node
agorasdk.node: $(obj).target/agorasdk.node $(builddir)/agorasdk.node

# Add executable to "all" target.
.PHONY: all
all: $(builddir)/agorasdk.node

