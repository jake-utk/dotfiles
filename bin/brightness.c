/* Copyright Jake Addis 2023 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#define MAX_BRIGHNESS_DIGITS 5  // "1060" + \n
#define MAX_VALUE 1060
#define MIN_VALUE 0
#define STEP_VALUE 106
#define INCREMENT 'u'
#define DECREMENT 'd'
#define BRIGHTNESS_FILE_PATH \
  "/sys/class/backlight/intel_backlight/brightness"

int read_current_setting(const char* file_path);
bool write_new_setting(const char* file_path, int setting);
int calc_new_setting(int current_setting, char operation);

int main(int argc, char** argv) {
  if (argc < 2) {
    perror("Did not pass argument\n");
    return EXIT_FAILURE;
  }
  char operation = argv[1][1];  // parses 'u' or 'd' from "-u" or "-d"
  if (operation != INCREMENT && operation != DECREMENT) {
    perror("Did not pass appropriate argument\n");
    return EXIT_FAILURE;
  }

  int current_setting = read_current_setting(BRIGHTNESS_FILE_PATH);
  if (current_setting == -1)
    return EXIT_FAILURE;

  int new_setting = calc_new_setting(current_setting, operation);
  if (!write_new_setting(BRIGHTNESS_FILE_PATH, new_setting))
    return EXIT_FAILURE;

  return EXIT_SUCCESS;
}

int read_current_setting(const char* file_path) {
  char buffer[MAX_BRIGHNESS_DIGITS + 1];
  FILE *f = fopen(file_path, "r");

  if (f == NULL) {
    perror("Error opening file\n");
    return -1;
  }

  if (fgets(buffer, sizeof(buffer), f) == NULL) {
    perror("Error reading file\n");
    fclose(f);
    return -1;
  }

  fclose(f);

  size_t len = strlen(buffer);
  if (len > 0 && buffer[len - 1] == '\n')
    buffer[len - 1] = '\0';

  return atoi(buffer);
}

int calc_new_setting(int current_setting, char operation) {
  int new_setting = current_setting;

  switch (operation) {
    case INCREMENT:
      new_setting += STEP_VALUE;
      if (new_setting > MAX_VALUE) new_setting = MAX_VALUE;
      break;
    case DECREMENT:
      new_setting -= STEP_VALUE;
      if (new_setting < MIN_VALUE) new_setting = MIN_VALUE;
      break;
  }

  return new_setting;
}

bool write_new_setting(const char* file_path, int setting) {
  FILE *f = fopen(file_path, "w");

  if (f == NULL) {
    perror("Error opening file\n");
    return false;
  }

  fprintf(f, "%d\n", setting);

  fclose(f);
  return true;
}
