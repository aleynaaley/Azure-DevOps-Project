import { useEffect, useState } from "react";
import { Music, X } from "lucide-react";

export default function ExampleSongs({ isOpen, onClose, setNotes }) {
  const [songs, setSongs] = useState([]);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    if (!isOpen) return;

    setLoading(true);

    fetch("https://lwapp-ocr-dev.azurewebsites.net/api/songs")
      .then((response) => {
        if (!response.ok) {
          throw new Error("Songs could not be loaded.");
        }

        return response.json();
      })
      .then((data) => {
        setSongs(data);
      })
      .catch((error) => {
        console.error("Error fetching songs:", error);
      })
      .finally(() => {
        setLoading(false);
      });
  }, [isOpen]);

  const selectSong = (song) => {
    setNotes(song.notes);
    onClose();
  };

  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 bg-black/50 backdrop-blur-sm flex items-center justify-center z-50 px-4">
      <div className="bg-white rounded-2xl shadow-2xl w-full max-w-lg p-6">

        <div className="flex items-center justify-between mb-6">
          <div className="flex items-center gap-2">
            <Music className="w-6 h-6 text-teal-700" />
            <h2 className="text-2xl font-bold text-gray-800">
              Example Songs
            </h2>
          </div>

          <button
            onClick={onClose}
            className="text-gray-500 hover:text-gray-800"
          >
            <X className="w-6 h-6" />
          </button>
        </div>

        {loading ? (
          <p className="text-gray-500 text-center">
            Loading songs...
          </p>
        ) : (
          <div className="space-y-3">
            {songs.map((song) => (
              <button
                key={song.id}
                onClick={() => selectSong(song)}
                className="w-full text-left p-4 rounded-xl border border-gray-200 hover:bg-teal-50 hover:border-teal-300 transition"
              >
                <p className="font-semibold text-gray-800">
                  {song.name}
                </p>

                <p className="text-sm text-gray-500 mt-1">
                  {song.notes}
                </p>
              </button>
            ))}
          </div>
        )}

      </div>
    </div>
  );
}
