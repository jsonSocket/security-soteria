#!/bin/sh
#
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
#
# Copyright (c) 2015-2017 Oracle and/or its affiliates. All rights reserved.
#
# The contents of this file are subject to the terms of either the GNU
# General Public License Version 2 only ("GPL") or the Common Development
# and Distribution License("CDDL") (collectively, the "License").  You
# may not use this file except in compliance with the License.  You can
# obtain a copy of the License at
# https://oss.oracle.com/licenses/CDDL+GPL-1.1
# or LICENSE.txt.  See the License for the specific
# language governing permissions and limitations under the License.
#
# When distributing the software, include this License Header Notice in each
# file and include the License file at LICENSE.txt.
#
# GPL Classpath Exception:
# Oracle designates this particular file as subject to the "Classpath"
# exception as provided by Oracle in the GPL Version 2 section of the License
# file that accompanied this code.
#
# Modifications:
# If applicable, add the following below the License Header, with the fields
# enclosed by brackets [] replaced by your own identifying information:
# "Portions Copyright [year] [name of copyright owner]"
#
# Contributor(s):
# If you wish your version of this file to be governed by only the CDDL or
# only the GPL Version 2, indicate your decision by adding "[Contributor]
# elects to include this software in this distribution under the [CDDL or GPL
# Version 2] license."  If you don't indicate a single choice of license, a
# recipient has the option to distribute your version of this file under
# either the CDDL, the GPL Version 2 or to extend the choice of license to
# its licensees as provided above.  However, if you add GPL Version 2 code
# and therefore, elected the GPL Version 2 license, then the option applies
# only if the new code is made subject to such option by the copyright
# holder.
#

#------------------------------------------------------
#-- BE SURE TO HAVE THE FOLLOWING IN YOUR SETTINGS.XML
#------------------------------------------------------
#
#    <servers>
#        <server>
#            <id>jvnet-nexus-staging</id>
#            <username>jvnet_id</username>
#            <password>password</password>
#        </server>
#    </servers>
#    <profiles>
#      <profile>
#        <id>release</id>
#        <properties>
#          <release.arguments>-Dhttps.proxyHost=www-proxy.us.oracle.com -Dhttps.proxyPort=80 -Dgpg.passphrase=glassfish -Pjvnet-release</release.arguments>
#        </properties>
#        <activation>
#          <activeByDefault>false</activeByDefault>
#        </activation>
#      </profile>
#    </profiles>

# see the following URL for gpg issues
# https://docs.sonatype.org/display/Repository/How+To+Generate+PGP+Signatures+With+Maven#HowToGeneratePGPSignaturesWithMaven-GenerateaKeyPair

# login to nexus at maven.java.net and release (Close) the artifact
# https://maven.java.net/index.html#stagingRepositories

# More information:
# https://docs.sonatype.org/display/Repository/Sonatype+OSS+Maven+Repository+Usage+Guide#SonatypeOSSMavenRepositoryUsageGuide-8.ReleaseIt
# http://aseng-wiki.us.oracle.com/asengwiki/display/GlassFish/Migrating+Maven+deployment+to+maven.java.net

mvn -B release:prepare -Prelease
mvn -B release:perform -Prelease

