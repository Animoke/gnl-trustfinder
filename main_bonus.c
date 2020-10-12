#include "get_next_line.h"

int		main(int ac, char **av)
{
	(void)ac;
	(void)av;
	char *line;
	int fd1 = open("aaa", O_RDONLY);
	int fd2 = open("bbb", O_RDONLY);
	int d = 1;
	while (d)
	{
		if (d &= (get_next_line(fd1, &line) > 0))
		{
			printf("%s\n", line);
			free(line);
		}
		if (d &= (get_next_line(fd2, &line) > 0))
		{
			printf("%s\n", line);
			free(line);
		}
	}
	free(line);
	system("leaks a.out");
	return (0);
}
