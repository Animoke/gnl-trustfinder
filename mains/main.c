#include "get_next_line.h"

int		main(int ac, char **av)
{
	(void)ac;
	char *line;
	int fd = open(av[1], O_RDONLY);
	int d;
	while ((d = get_next_line(fd, &line)) > 0)
	{
		printf("%s\n", line);
		free(line);
	}
	free(line);
//	system("leaks a.out");
	return (0);
}
