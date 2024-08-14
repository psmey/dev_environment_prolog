FROM swipl:stable

RUN apt update \
    && apt upgrade -y \
    && apt install git -y

CMD ["swipl", "./src/familybusiness.pl"]
