# This file can be used to create a docker container based on Ubuntu
# for the ITS2 database

FROM ubuntu:latest
MAINTAINER Frank Förster <frank.foerster@biozentrum.uni-wuerzburg.de>


# Install packages from first installation step
RUN apt-get update && apt-get install --quiet --assume-yes \
    bzip2 \
    fonts-liberation \
    gcc \
    git \
    libapache2-mod-fcgid \
    libapache2-mod-php5 \
    libdbd-pg-perl \
    libgd3 \
    libjson-xs-perl \
    librsvg2-bin \
    libxml-perl \
    libxml-libxml-perl \
    make \
    subversion \
    tar \
    zip

# install required perl modules
RUN for MODULE in \
	WWW::Mechanize \
	Test::WWW::Mechanize \
	DBIx::Class::Schema::Loader \
	XML::LibXML \
	Bio::SearchIO \
	Class::MOP \
	YAML::XS \
	Hash::Merge \
	FCGI \
	FCGI::ProcManager \
	Switch \
	String::Random \
	DBD::SQLite \
	DBD::Pg \
	DBICx::Deploy \
	DBIx::Class \
	DBIx::Class::Tree \
	DateTime \
	DateTime::Format::Pg \
	XML::Simple \
	Catalyst::Devel \
	Catalyst::Helper::View::TT \
	Catalyst::View::JSON \
	Catalyst::View::Download \
	Catalyst::Plugin::Session \
	Catalyst::Plugin::Session::Store::FastMmap \
	Catalyst::Plugin::Session::State::Cookie \
	Catalyst::Model::DBIC::Schema \
	Catalyst::Controller::BindLex \
	Catalyst::Controller::REST; \
	do perl -MCPAN -e "install $MODULE"; done

# Adding the required packages to add PPAs:
RUN apt-get install --assume-yes software-properties-common
