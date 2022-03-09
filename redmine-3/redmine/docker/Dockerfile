FROM redmine:4.2.3

RUN apt-get update && apt-get install -y gcc make
RUN gem install ruby-debug-ide debase

ADD start-with-debugger.sh /start-with-debugger.sh
RUN chmod +x /start-with-debugger.sh
RUN sed -i ".org" -e 's/ passenger )/passenger | rdebug-ide)/' /docker-entrypoint.sh
ENTRYPOINT ["/start-with-debugger.sh"]
CMD [""]
