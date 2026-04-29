FROM ruby:3.3-slim

# Install system packages
RUN apt-get update && apt-get install -y \
  build-essential \
  libpq-dev \
  git \
  curl \
  imagemagick \
  libyaml-dev \
  && rm -rf /var/lib/apt/lists/*

# Install Node.js 20.x via NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
  apt-get install -y nodejs && \
  rm -rf /var/lib/apt/lists/*

# Install Yarn
RUN npm install -g yarn

WORKDIR /app

# Copy Gemfile and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy package.json and install packages
COPY package.json yarn.lock ./
RUN yarn install

# Copy application code
COPY . .

ENTRYPOINT ["docker/entrypoint.sh"]
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
