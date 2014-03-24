#!/bin/bash

# Sandboa Development Cluster Configuration Bootstrap
#

ROCKS_VERSION=`rocks report version`

KICKSTART_DISTRO_DIR=`rocks list attr | grep Kickstart_DistroDir | awk '{print $2}'`
KICKSTART_BASE_DIR=`rocks list attr | grep Kickstart_PrivateKickstartBasedir | awk '{print $2}'`
KICKSTART_ROOT_DIR="$KICKSTART_DISTRO_DIR/$KICKSTART_BASE_DIR"

SITE_PROFILES_DIR="$KICKSTART_ROOT_DIR/site-profiles/$ROCKS_VERSION"
CONFIG_DIR=`pwd`
GRAPH_FILES_DIR="graphs/default"
NODE_FILES_DIR="nodes"
GRAPH_FILES=`ls $CONFIG_DIR/$GRAPH_FILES_DIR`
NODE_FILES=`ls $CONFIG_DIR/$NODE_FILES_DIR`

for GRAPH_FILE in $GRAPH_FILES;
do
	cp -avf "$CONFIG_DIR/$GRAPH_FILES_DIR/$GRAPH_FILE" "$SITE_PROFILES_DIR/$GRAPH_FILES_DIR/$GRAPH_FILE"
done

for NODE_FILE in $NODE_FILES;
do
	cp -avf "$CONFIG_DIR/$NODE_FILES_DIR/$NODE_FILE" "$SITE_PROFILES_DIR/$NODE_FILES_DIR/$NODE_FILE"
done
