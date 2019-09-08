docker run -d \
	-p 45444:45444 \
	-v reddcoin_data:/data/reddcoin \
	-e WALLET_PASSPHRASE=TTkjfijQyKyUd9t5miZMeCr5y39WZP3P \
	--restart unless-stopped \
	--name reddcoin-staker \
	4reallive/reddstake:latest
