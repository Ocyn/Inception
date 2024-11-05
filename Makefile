# VARIABLES


NAME	= Inception


# DIRS

SRC_DIR = ./srcs/docker-compose.yml


# COMMANDS MACROS

DOCKER_C = docker-compose



# RULES

all: $(NAME)

$(NAME):
	$(DOCKER_C) -f $(SRC_DIR) up --build -d

down:
	$(DOCKER_C) -f $(SRC_DIR) down

stop:
	$(DOCKER_C) -f $(SRC_DIR) stop

clean:
	$(DOCKER_C) -f $(SRC_DIR) down -v --rmi all

fclean: clean
	

restart: down all

re: clean all



# .SILENT:

.PHONY: all