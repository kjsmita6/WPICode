#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct node_t {
	struct node_t *left, *right;
	int freq;
	char c;
} *node;

struct node_t pool[256] = {{0}};
node qqq[255], *q = qqq - 1;
int n_nodes = 0, qend = 1;
char *code[128] = {0}, buf[1024];

node new_node(int freq, char c, node a, node b)
{
	node n = pool + n_nodes++;
	if (freq) {
		n->c = c;
		n->freq = freq;
	}
	else {
		n->left = a;
		n->right = b;
		n->freq = a->freq + b->freq;
	}
	return n;
}

void queue_insert(node n)
{
	int j;
	int i = qend++;
	while ((j = i / 2)) {
		if (q[j]->freq <= n->freq) {
			break;
		}
		else {
			q[i] = q[j], i = j;
		}
	}
	q[i] = n;
}

node queue_remove()
{
	int i = 1;
	int l = 0;
	node n = q[i];

	if (qend < 2) {
		return 0;
	}
	qend--;
	while ((l = i * 2) < qend) {
		if (l + 1 < qend && q[l + 1]->freq < q[l]->freq) {
			l++;
		}
		q[i] = q[l];
		i = l;
	}
	q[i] = q[qend];
	return n;
}

void huff_gen(node n, char *s, int len)
{
	static char *out = buf;
	if (n->c) {
		s[len] = 0;
		strcpy(out, s);
		code[n->c] = out;
		out += len + 1;
		return;
	}

	s[len] = '0';
	huff_gen(n->left,  s, len + 1);
	s[len] = '1';
	huff_gen(n->right, s, len + 1);
}

void huff_freq(const char *s)
{
	int i;
	int freq[128] = {0};
	char c[16];

	while (*s) {
		freq[(int)*s++]++;
	}
	for (i = 0; i < 128; i++) {
		if (freq[i]) {
			queue_insert(new_node(freq[i], i, 0, 0));
		}
	}
	while (qend > 2) {
		queue_insert(new_node(0, 0, queue_remove(), queue_remove()));
	}
	huff_gen(q[1], c, 0);
}

void huff_encode(const char *s, char *out)
{
	while (*s) {
		strcpy(out, code[*s]);
		out += strlen(code[*s++]);
	}
}

void huff_decode(const char *s, node t, char *out)
{
	node n = t;
	int i = 0;
	while (*s) {
		if (*s++ == '0') {
			n = n->left;
		}
		else {
			n = n->right;
		}

		if (n->c) {
			out[i] = n->c;
			n = t;
			i++;
		}
	}
}

int main(int argc, const char *argv[])
{
	char input[128], output[128], string[1024], buffer[1024];
	printf("Name of file to compress: ");
	scanf("%s", input);
	FILE *in = fopen(input, "r");
	fgets(string, 1024, in);

	huff_freq(string);
	huff_encode(string, buffer);

	printf("Name of file to output: ");
	scanf("%s", output);
	FILE *out = fopen(output, "w");
	printf("%s", buffer);
	fwrite(buffer, sizeof(char), sizeof(buffer), out);

	printf("Name of file to decompress: ");
	char input1[1024];
	scanf("%s", input1);
	FILE *in1 = fopen(input1, "r");
	char string1[4096];
	fgets(string1, 4096, in1);

	char buffer1[1024];
	huff_decode(string1, q[1], buffer1);
	printf("Name of file to output: ");
	char output1[1024];
	scanf("%s", output1);
	FILE *out1 = fopen(output1, "w");
	fprintf(out1, "%s", buffer1);
	return EXIT_SUCCESS;
}
