#include <unistd.h>
#include <string.h>

int	main(__attribute__ ((unused)) int ac, char **av) {
	char proper_title[30];

	for (int i = 0; i < 30; i ++) {
		if (av[1][i + 9] == ' ' && av[1][i + 9 + 1] == ' ' && av[1][i + 9 + 2] == ' ') {
			proper_title[i] ='\0';
			write(1, proper_title, strlen(proper_title));
			return (0);
		}
		proper_title[i] = av[1][i + 9];
	}
	return (0);
}
