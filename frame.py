import cv2
import os

ASCII_CHARS = "█▓▒░@%#*+=-:. "

def pixel_to_ascii_color(pixel):
    b, g, r = pixel
    gray = 0.2989 * r + 0.5870 * g + 0.1140 * b
    char = ASCII_CHARS[int(gray / 256 * len(ASCII_CHARS))]

    if r > 240 and g > 240 and b > 240:
        return " "

    return f"\033[48;2;{r};{g};{b}m\033[38;2;{r};{g};{b}m{char}\033[0m"

def frame_to_ascii_color(frame, new_width=100):
    height, width, _ = frame.shape
    aspect_ratio = height / width
    new_height = int(new_width * aspect_ratio * 0.65)
    resized_frame = cv2.resize(frame, (new_width, new_height), interpolation=cv2.INTER_AREA)

    ascii_frame = "\n".join(
        "".join(pixel_to_ascii_color(pixel) for pixel in row)
        for row in resized_frame
    )
    return ascii_frame

def save_frames_to_ascii(video_path, output_dir, width):
    cap = cv2.VideoCapture(video_path)
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    frame_count = 0
    while cap.isOpened():
        ret, frame = cap.read()
        if not ret:
            break

        ascii_frame = frame_to_ascii_color(frame, width)
        with open(f"{output_dir}/frame_{frame_count:04d}.txt", "w", encoding="utf-8") as f:
            f.write(ascii_frame)
        frame_count += 1

    cap.release()
    print(f"Converted {frame_count} frames to ASCII art with color and saved to '{output_dir}'.")

if __name__ == "__main__":
    base_path = "/home/reimunyancat/Archive/kururin/"
    video_path = base_path + "kuru_kuru.mp4"
    output_dir = base_path + "frames"
    save_frames_to_ascii(video_path, output_dir, width=100)

