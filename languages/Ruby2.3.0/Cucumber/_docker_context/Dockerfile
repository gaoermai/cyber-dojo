FROM       cyberdojofoundation/ruby-2.3.0_rspec
MAINTAINER Jon Jagger <jon@jaggersoft.com>

RUN apt-get update
RUN apt-get install -y libqt4-dev libqtwebkit-dev

RUN gem install --no-rdoc --no-ri shoulda
RUN gem install --no-rdoc --no-ri cucumber
RUN gem install --no-rdoc --no-ri rspec-mocks
RUN gem install --no-rdoc --no-ri capybara
RUN gem install --no-rdoc --no-ri capybara-webkit